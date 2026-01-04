(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_03 obj_07 - type_2
obj_10 obj_02 obj_08 obj_11 - type_1
obj_06 obj_04 obj_09 - type_3
obj_01 obj_05 - object)
(:init
(pred_3 obj_03 obj_04)
(pred_1 obj_03 obj_10)
(pred_1 obj_03 obj_02)
(pred_3 obj_07 obj_04)
(pred_1 obj_07 obj_08)
(pred_1 obj_07 obj_11)
(pred_4 obj_01 obj_06)
(pred_4 obj_05 obj_09)
)
(:goal
(and
(pred_4 obj_01 obj_04)
(pred_4 obj_05 obj_04)
)
)

(:constraints
  (always (not (pred_3 obj_03 obj_09)))
)
)