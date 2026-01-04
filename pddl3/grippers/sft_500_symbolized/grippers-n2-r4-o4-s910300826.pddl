(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_11 obj_14 - type_3
obj_06 obj_08 obj_05 obj_09 - type_2
obj_10 obj_02 obj_01 obj_12 - type_1
obj_03 obj_04 obj_13 obj_07 - object)
(:init
(pred_2 obj_11 obj_02)
(pred_4 obj_11 obj_06)
(pred_4 obj_11 obj_08)
(pred_2 obj_14 obj_10)
(pred_4 obj_14 obj_05)
(pred_4 obj_14 obj_09)
(pred_3 obj_03 obj_01)
(pred_3 obj_04 obj_01)
(pred_3 obj_13 obj_02)
(pred_3 obj_07 obj_10)
)
(:goal
(and
(pred_3 obj_03 obj_01)
(pred_3 obj_04 obj_02)
(pred_3 obj_13 obj_01)
(pred_3 obj_07 obj_02)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_11 obj_02) (pred_2 obj_14 obj_02))))
  )
)
)