(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_13 obj_07 - type_3
obj_01 obj_09 obj_04 obj_12 - type_2
obj_02 obj_10 obj_11 obj_06 - type_1
obj_03 obj_05 obj_08 - object)
(:init
(pred_1 obj_13 obj_10)
(pred_2 obj_13 obj_01)
(pred_2 obj_13 obj_09)
(pred_1 obj_07 obj_10)
(pred_2 obj_07 obj_04)
(pred_2 obj_07 obj_12)
(pred_4 obj_03 obj_11)
(pred_4 obj_05 obj_10)
(pred_4 obj_08 obj_06)
)
(:goal
(and
(pred_4 obj_03 obj_10)
(pred_4 obj_05 obj_11)
(pred_4 obj_08 obj_10)
)
)

(:constraints
  (always (not (pred_1 obj_13 obj_11)))
)
)