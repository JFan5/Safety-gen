(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_01 obj_13 - type_3
obj_02 obj_04 obj_12 obj_08 - type_2
obj_14 obj_11 obj_09 obj_07 - type_1
obj_05 obj_10 obj_03 obj_06 - object)
(:init
(pred_2 obj_01 obj_09)
(pred_3 obj_01 obj_02)
(pred_3 obj_01 obj_04)
(pred_2 obj_13 obj_14)
(pred_3 obj_13 obj_12)
(pred_3 obj_13 obj_08)
(pred_4 obj_05 obj_14)
(pred_4 obj_10 obj_09)
(pred_4 obj_03 obj_09)
(pred_4 obj_06 obj_14)
)
(:goal
(and
(pred_4 obj_05 obj_09)
(pred_4 obj_10 obj_11)
(pred_4 obj_03 obj_14)
(pred_4 obj_06 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_2 obj_01 obj_11) (pred_2 obj_13 obj_11))))
    (always (not (and (pred_2 obj_01 obj_09) (pred_2 obj_13 obj_09))))
  )
)
)