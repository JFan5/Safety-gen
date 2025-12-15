(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_14 obj_02 - type_1
obj_08 obj_05 obj_12 obj_09 - type_3
obj_03 obj_04 obj_07 obj_06 - type_2
obj_13 obj_10 obj_01 obj_11 - object)
(:init
(pred_3 obj_14 obj_03)
(pred_4 obj_14 obj_08)
(pred_4 obj_14 obj_05)
(pred_3 obj_02 obj_07)
(pred_4 obj_02 obj_12)
(pred_4 obj_02 obj_09)
(pred_2 obj_13 obj_03)
(pred_2 obj_10 obj_04)
(pred_2 obj_01 obj_03)
(pred_2 obj_11 obj_04)
)
(:goal
(and
(pred_2 obj_13 obj_06)
(pred_2 obj_10 obj_03)
(pred_2 obj_01 obj_04)
(pred_2 obj_11 obj_06)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_14 obj_04) (pred_3 obj_02 obj_04))))
    (always (not (and (pred_3 obj_14 obj_06) (pred_3 obj_02 obj_06))))
  )
)
)