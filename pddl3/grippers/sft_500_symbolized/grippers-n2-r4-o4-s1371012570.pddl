(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_12 obj_08 - type_2
obj_09 obj_06 obj_07 obj_11 - type_3
obj_13 obj_10 obj_02 obj_01 - type_1
obj_14 obj_05 obj_04 obj_03 - object)
(:init
(pred_3 obj_12 obj_01)
(pred_4 obj_12 obj_09)
(pred_4 obj_12 obj_06)
(pred_3 obj_08 obj_02)
(pred_4 obj_08 obj_07)
(pred_4 obj_08 obj_11)
(pred_2 obj_14 obj_13)
(pred_2 obj_05 obj_13)
(pred_2 obj_04 obj_13)
(pred_2 obj_03 obj_02)
)
(:goal
(and
(pred_2 obj_14 obj_13)
(pred_2 obj_05 obj_10)
(pred_2 obj_04 obj_02)
(pred_2 obj_03 obj_02)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_12 obj_02) (pred_3 obj_08 obj_02))))
  )
)
)