(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_12 - type_1
obj_02 obj_11 obj_09 obj_06 - type_2
obj_10 obj_05 obj_13 obj_04 - type_3
obj_07 obj_08 obj_03 - object)
(:init
(pred_2 obj_01 obj_13)
(pred_1 obj_01 obj_02)
(pred_1 obj_01 obj_11)
(pred_2 obj_12 obj_05)
(pred_1 obj_12 obj_09)
(pred_1 obj_12 obj_06)
(pred_3 obj_07 obj_04)
(pred_3 obj_08 obj_05)
(pred_3 obj_03 obj_05)
)
(:goal
(and
(pred_3 obj_07 obj_10)
(pred_3 obj_08 obj_10)
(pred_3 obj_03 obj_10)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_01 obj_10) (pred_2 obj_12 obj_10))))
  )
)
)