(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_04 - type_2
obj_13 obj_05 obj_07 obj_09 - type_3
obj_06 obj_12 obj_02 obj_10 - type_1
obj_11 obj_08 obj_03 - object)
(:init
(pred_2 obj_01 obj_10)
(pred_3 obj_01 obj_13)
(pred_3 obj_01 obj_05)
(pred_2 obj_04 obj_12)
(pred_3 obj_04 obj_07)
(pred_3 obj_04 obj_09)
(pred_4 obj_11 obj_06)
(pred_4 obj_08 obj_12)
(pred_4 obj_03 obj_02)
)
(:goal
(and
(pred_4 obj_11 obj_02)
(pred_4 obj_08 obj_10)
(pred_4 obj_03 obj_10)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_01 obj_10) (pred_2 obj_04 obj_10))))
  )
)
)