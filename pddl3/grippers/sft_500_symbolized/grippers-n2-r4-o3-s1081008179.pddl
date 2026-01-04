(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_07 obj_06 - type_3
obj_13 obj_09 obj_10 obj_05 - type_2
obj_02 obj_12 obj_01 obj_11 - type_1
obj_03 obj_04 obj_08 - object)
(:init
(pred_2 obj_07 obj_12)
(pred_4 obj_07 obj_13)
(pred_4 obj_07 obj_09)
(pred_2 obj_06 obj_11)
(pred_4 obj_06 obj_10)
(pred_4 obj_06 obj_05)
(pred_3 obj_03 obj_02)
(pred_3 obj_04 obj_12)
(pred_3 obj_08 obj_11)
)
(:goal
(and
(pred_3 obj_03 obj_11)
(pred_3 obj_04 obj_11)
(pred_3 obj_08 obj_12)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_07 obj_02) (pred_2 obj_06 obj_02))))
    (always (not (and (pred_2 obj_07 obj_11) (pred_2 obj_06 obj_11))))
  )
)
)