(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_02 obj_01 - type_3
obj_08 obj_05 obj_04 obj_07 - type_2
obj_10 obj_09 obj_03 obj_13 - type_1
obj_11 obj_12 obj_06 - object)
(:init
(pred_1 obj_02 obj_03)
(pred_3 obj_02 obj_08)
(pred_3 obj_02 obj_05)
(pred_1 obj_01 obj_13)
(pred_3 obj_01 obj_04)
(pred_3 obj_01 obj_07)
(pred_2 obj_11 obj_13)
(pred_2 obj_12 obj_03)
(pred_2 obj_06 obj_09)
)
(:goal
(and
(pred_2 obj_11 obj_09)
(pred_2 obj_12 obj_09)
(pred_2 obj_06 obj_13)
)
)

(:constraints
  (and
    (always (not (and (pred_1 obj_02 obj_09) (pred_1 obj_01 obj_09))))
    (always (not (and (pred_1 obj_02 obj_13) (pred_1 obj_01 obj_13))))
  )
)
)