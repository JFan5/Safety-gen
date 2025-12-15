(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_07 obj_01 - type_1
obj_05 obj_11 obj_12 obj_06 - type_3
obj_04 obj_13 obj_10 obj_09 - type_2
obj_03 obj_08 obj_02 - object)
(:init
(pred_3 obj_07 obj_10)
(pred_4 obj_07 obj_05)
(pred_4 obj_07 obj_11)
(pred_3 obj_01 obj_13)
(pred_4 obj_01 obj_12)
(pred_4 obj_01 obj_06)
(pred_2 obj_03 obj_04)
(pred_2 obj_08 obj_13)
(pred_2 obj_02 obj_09)
)
(:goal
(and
(pred_2 obj_03 obj_09)
(pred_2 obj_08 obj_04)
(pred_2 obj_02 obj_04)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_07 obj_04) (pred_3 obj_01 obj_04))))
    (always (not (and (pred_3 obj_07 obj_09) (pred_3 obj_01 obj_09))))
  )
)
)