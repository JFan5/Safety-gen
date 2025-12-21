(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_12 - type_1
obj_09 obj_02 obj_07 obj_08 - type_2
obj_05 obj_13 obj_10 obj_11 - type_3
obj_06 obj_03 obj_04 - object)
(:init
(pred_1 obj_01 obj_13)
(pred_3 obj_01 obj_09)
(pred_3 obj_01 obj_02)
(pred_1 obj_12 obj_10)
(pred_3 obj_12 obj_07)
(pred_3 obj_12 obj_08)
(pred_2 obj_06 obj_10)
(pred_2 obj_03 obj_05)
(pred_2 obj_04 obj_10)
)
(:goal
(and
(pred_2 obj_06 obj_13)
(pred_2 obj_03 obj_05)
(pred_2 obj_04 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_01 obj_13) (pred_1 obj_12 obj_13))))
  )
)
)