(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_05 obj_06 - type_1
obj_09 obj_10 obj_11 obj_04 - type_2
obj_02 obj_03 obj_08 - type_3
obj_07 obj_12 obj_01 - object)
(:init
(pred_1 obj_05 obj_08)
(pred_3 obj_05 obj_09)
(pred_3 obj_05 obj_10)
(pred_1 obj_06 obj_08)
(pred_3 obj_06 obj_11)
(pred_3 obj_06 obj_04)
(pred_2 obj_07 obj_02)
(pred_2 obj_12 obj_08)
(pred_2 obj_01 obj_02)
)
(:goal
(and
(pred_2 obj_07 obj_02)
(pred_2 obj_12 obj_03)
(pred_2 obj_01 obj_02)
)
)

(:constraints
  (always (not (pred_1 obj_05 obj_03)))
)
)