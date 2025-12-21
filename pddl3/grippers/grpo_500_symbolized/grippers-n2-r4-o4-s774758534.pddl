(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_07 obj_11 - type_1
obj_14 obj_03 obj_04 obj_10 - type_3
obj_06 obj_09 obj_12 obj_08 - type_2
obj_13 obj_01 obj_05 obj_02 - object)
(:init
(pred_4 obj_07 obj_08)
(pred_2 obj_07 obj_14)
(pred_2 obj_07 obj_03)
(pred_4 obj_11 obj_09)
(pred_2 obj_11 obj_04)
(pred_2 obj_11 obj_10)
(pred_3 obj_13 obj_06)
(pred_3 obj_01 obj_06)
(pred_3 obj_05 obj_06)
(pred_3 obj_02 obj_09)
)
(:goal
(and
(pred_3 obj_13 obj_08)
(pred_3 obj_01 obj_06)
(pred_3 obj_05 obj_09)
(pred_3 obj_02 obj_09)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_07 obj_09) (pred_4 obj_11 obj_09))))
  )
)
)