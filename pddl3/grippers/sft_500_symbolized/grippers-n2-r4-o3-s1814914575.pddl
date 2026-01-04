(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_01 obj_06 - type_1
obj_08 obj_02 obj_09 obj_10 - type_2
obj_13 obj_03 obj_11 obj_12 - type_3
obj_04 obj_05 obj_07 - object)
(:init
(pred_3 obj_01 obj_03)
(pred_4 obj_01 obj_08)
(pred_4 obj_01 obj_02)
(pred_3 obj_06 obj_03)
(pred_4 obj_06 obj_09)
(pred_4 obj_06 obj_10)
(pred_1 obj_04 obj_11)
(pred_1 obj_05 obj_13)
(pred_1 obj_07 obj_13)
)
(:goal
(and
(pred_1 obj_04 obj_03)
(pred_1 obj_05 obj_11)
(pred_1 obj_07 obj_11)
)
)

(:constraints
  (always (not (pred_3 obj_01 obj_11)))
)
)