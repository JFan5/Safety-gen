(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_09 - type_1
obj_08 obj_10 obj_06 obj_05 - type_3
obj_14 obj_13 obj_01 obj_02 - type_2
obj_04 obj_12 obj_07 obj_11 - object)
(:init
(pred_4 obj_03 obj_02)
(pred_2 obj_03 obj_08)
(pred_2 obj_03 obj_10)
(pred_4 obj_09 obj_01)
(pred_2 obj_09 obj_06)
(pred_2 obj_09 obj_05)
(pred_3 obj_04 obj_01)
(pred_3 obj_12 obj_02)
(pred_3 obj_07 obj_01)
(pred_3 obj_11 obj_02)
)
(:goal
(and
(pred_3 obj_04 obj_02)
(pred_3 obj_12 obj_02)
(pred_3 obj_07 obj_14)
(pred_3 obj_11 obj_14)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_03 obj_14) (pred_4 obj_09 obj_14))))
    (always (not (and (pred_4 obj_03 obj_02) (pred_4 obj_09 obj_02))))
  )
)
)