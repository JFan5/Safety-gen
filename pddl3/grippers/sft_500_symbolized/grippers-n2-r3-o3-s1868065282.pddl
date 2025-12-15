(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_11 obj_05 - type_3
obj_04 obj_08 obj_01 obj_09 - type_2
obj_12 obj_06 obj_10 - type_1
obj_03 obj_02 obj_07 - object)
(:init
(pred_2 obj_11 obj_06)
(pred_3 obj_11 obj_04)
(pred_3 obj_11 obj_08)
(pred_2 obj_05 obj_12)
(pred_3 obj_05 obj_01)
(pred_3 obj_05 obj_09)
(pred_1 obj_03 obj_10)
(pred_1 obj_02 obj_06)
(pred_1 obj_07 obj_10)
)
(:goal
(and
(pred_1 obj_03 obj_12)
(pred_1 obj_02 obj_06)
(pred_1 obj_07 obj_12)
)
)

(:constraints
  (always (not (pred_2 obj_11 obj_10)))
)
)