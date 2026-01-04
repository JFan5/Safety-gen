(define (problem gripper-2-4-4)
(:domain gripper-strips)
(:objects obj_13 obj_01 - type_2
obj_10 obj_11 obj_08 obj_12 - type_1
obj_04 obj_03 obj_07 obj_09 - type_3
obj_05 obj_02 obj_06 obj_14 - object)
(:init
(pred_4 obj_13 obj_09)
(pred_1 obj_13 obj_10)
(pred_1 obj_13 obj_11)
(pred_4 obj_01 obj_04)
(pred_1 obj_01 obj_08)
(pred_1 obj_01 obj_12)
(pred_2 obj_05 obj_09)
(pred_2 obj_02 obj_04)
(pred_2 obj_06 obj_09)
(pred_2 obj_14 obj_07)
)
(:goal
(and
(pred_2 obj_05 obj_04)
(pred_2 obj_02 obj_09)
(pred_2 obj_06 obj_03)
(pred_2 obj_14 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_4 obj_13 obj_09) (pred_4 obj_01 obj_09))))
  )
)
)