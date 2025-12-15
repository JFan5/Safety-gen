(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_02 obj_07 - type_1
obj_08 obj_09 obj_12 obj_03 - type_3
obj_11 obj_13 obj_04 obj_06 - type_2
obj_10 obj_14 obj_05 obj_01 - object)
(:init
(pred_3 obj_02 obj_06)
(pred_4 obj_02 obj_08)
(pred_4 obj_02 obj_09)
(pred_3 obj_07 obj_13)
(pred_4 obj_07 obj_12)
(pred_4 obj_07 obj_03)
(pred_2 obj_10 obj_06)
(pred_2 obj_14 obj_06)
(pred_2 obj_05 obj_04)
(pred_2 obj_01 obj_11)
)
(:goal
(and
(pred_2 obj_10 obj_11)
(pred_2 obj_14 obj_04)
(pred_2 obj_05 obj_06)
(pred_2 obj_01 obj_11)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_02 obj_04) (pred_3 obj_07 obj_04))))
    (always (not (and (pred_3 obj_02 obj_06) (pred_3 obj_07 obj_06))))
  )
)
)