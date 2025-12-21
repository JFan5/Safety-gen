(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_03 obj_08 - type_1
obj_12 obj_14 obj_09 obj_07 - type_3
obj_13 obj_01 obj_02 obj_05 - type_2
obj_04 obj_10 obj_06 obj_11 - object)
(:init
(pred_4 obj_03 obj_05)
(pred_2 obj_03 obj_12)
(pred_2 obj_03 obj_14)
(pred_4 obj_08 obj_01)
(pred_2 obj_08 obj_09)
(pred_2 obj_08 obj_07)
(pred_3 obj_04 obj_05)
(pred_3 obj_10 obj_05)
(pred_3 obj_06 obj_02)
(pred_3 obj_11 obj_13)
)
(:goal
(and
(pred_3 obj_04 obj_13)
(pred_3 obj_10 obj_02)
(pred_3 obj_06 obj_05)
(pred_3 obj_11 obj_13)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_03 obj_02) (pred_4 obj_08 obj_02))))
    (always (not (and (pred_4 obj_03 obj_05) (pred_4 obj_08 obj_05))))
  )
)
)