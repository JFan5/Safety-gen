(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_01 obj_02 - type_2
obj_04 obj_12 obj_11 obj_06 - type_3
obj_09 obj_07 obj_03 - type_1
obj_08 obj_10 obj_05 - object)
(:init
(pred_3 obj_01 obj_09)
(pred_2 obj_01 obj_04)
(pred_2 obj_01 obj_12)
(pred_3 obj_02 obj_07)
(pred_2 obj_02 obj_11)
(pred_2 obj_02 obj_06)
(pred_1 obj_08 obj_03)
(pred_1 obj_10 obj_07)
(pred_1 obj_05 obj_07)
)
(:goal
(and
(pred_1 obj_08 obj_07)
(pred_1 obj_10 obj_09)
(pred_1 obj_05 obj_07)
)
)

(:constraints
  (always (not (pred_3 obj_01 obj_03)))
)
)