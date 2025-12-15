(define (problem gripper-2-4-3)
(:domain gripper-strips)
(:objects obj_12 obj_02 - type_3
obj_01 obj_06 obj_11 obj_04 - type_1
obj_09 obj_03 obj_08 obj_05 - type_2
obj_13 obj_07 obj_10 - object)
(:init
(pred_2 obj_12 obj_08)
(pred_1 obj_12 obj_01)
(pred_1 obj_12 obj_06)
(pred_2 obj_02 obj_08)
(pred_1 obj_02 obj_11)
(pred_1 obj_02 obj_04)
(pred_3 obj_13 obj_08)
(pred_3 obj_07 obj_03)
(pred_3 obj_10 obj_05)
)
(:goal
(and
(pred_3 obj_13 obj_08)
(pred_3 obj_07 obj_08)
(pred_3 obj_10 obj_03)
)
)

(:constraints
  (always (not (pred_2 obj_12 obj_05)))
)
)