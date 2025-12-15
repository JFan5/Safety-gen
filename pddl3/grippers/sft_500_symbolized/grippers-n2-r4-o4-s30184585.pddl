(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_04 obj_02 - type_3
obj_03 obj_09 obj_14 obj_05 - type_1
obj_12 obj_13 obj_11 obj_06 - type_2
obj_01 obj_08 obj_07 obj_10 - object)
(:init
(pred_1 obj_04 obj_06)
(pred_2 obj_04 obj_03)
(pred_2 obj_04 obj_09)
(pred_1 obj_02 obj_11)
(pred_2 obj_02 obj_14)
(pred_2 obj_02 obj_05)
(pred_4 obj_01 obj_12)
(pred_4 obj_08 obj_13)
(pred_4 obj_07 obj_12)
(pred_4 obj_10 obj_12)
)
(:goal
(and
(pred_4 obj_01 obj_11)
(pred_4 obj_08 obj_06)
(pred_4 obj_07 obj_06)
(pred_4 obj_10 obj_12)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_04 obj_11) (pred_1 obj_02 obj_11))))
    (always (not (and (pred_1 obj_04 obj_06) (pred_1 obj_02 obj_06))))
  )
)
)