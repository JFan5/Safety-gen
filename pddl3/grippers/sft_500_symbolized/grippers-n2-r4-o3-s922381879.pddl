(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_10 obj_06 - type_3
obj_01 obj_13 obj_04 obj_07 - type_1
obj_09 obj_02 obj_08 obj_11 - type_2
obj_12 obj_05 obj_03 - object)
(:init
(pred_2 obj_10 obj_08)
(pred_1 obj_10 obj_01)
(pred_1 obj_10 obj_13)
(pred_2 obj_06 obj_02)
(pred_1 obj_06 obj_04)
(pred_1 obj_06 obj_07)
(pred_3 obj_12 obj_08)
(pred_3 obj_05 obj_08)
(pred_3 obj_03 obj_11)
)
(:goal
(and
(pred_3 obj_12 obj_08)
(pred_3 obj_05 obj_11)
(pred_3 obj_03 obj_11)
)
)

(:constraints
  (always (not (pred_2 obj_10 obj_11)))
)
)