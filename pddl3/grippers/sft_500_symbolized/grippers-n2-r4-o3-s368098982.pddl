(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_05 obj_06 - type_2
obj_07 obj_12 obj_01 obj_09 - type_3
obj_04 obj_13 obj_03 obj_08 - type_1
obj_11 obj_02 obj_10 - object)
(:init
(pred_3 obj_05 obj_13)
(pred_4 obj_05 obj_07)
(pred_4 obj_05 obj_12)
(pred_3 obj_06 obj_13)
(pred_4 obj_06 obj_01)
(pred_4 obj_06 obj_09)
(pred_1 obj_11 obj_04)
(pred_1 obj_02 obj_08)
(pred_1 obj_10 obj_03)
)
(:goal
(and
(pred_1 obj_11 obj_13)
(pred_1 obj_02 obj_03)
(pred_1 obj_10 obj_13)
)
)

(:constraints
  (always (not (pred_3 obj_05 obj_03)))
)
)