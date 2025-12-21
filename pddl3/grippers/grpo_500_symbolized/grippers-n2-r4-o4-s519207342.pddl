(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_10 obj_01 - type_1
obj_09 obj_14 obj_03 obj_05 - type_3
obj_11 obj_08 obj_04 obj_06 - type_2
obj_13 obj_02 obj_12 obj_07 - object)
(:init
(pred_4 obj_10 obj_06)
(pred_2 obj_10 obj_09)
(pred_2 obj_10 obj_14)
(pred_4 obj_01 obj_08)
(pred_2 obj_01 obj_03)
(pred_2 obj_01 obj_05)
(pred_3 obj_13 obj_11)
(pred_3 obj_02 obj_08)
(pred_3 obj_12 obj_11)
(pred_3 obj_07 obj_11)
)
(:goal
(and
(pred_3 obj_13 obj_04)
(pred_3 obj_02 obj_11)
(pred_3 obj_12 obj_04)
(pred_3 obj_07 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_10 obj_11) (pred_4 obj_01 obj_11))))
    (always (not (and (pred_4 obj_10 obj_04) (pred_4 obj_01 obj_04))))
  )
)
)