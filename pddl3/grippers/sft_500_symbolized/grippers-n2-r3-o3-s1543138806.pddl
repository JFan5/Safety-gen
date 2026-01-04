(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_06 - type_3
obj_05 obj_04 obj_11 obj_01 - type_2
obj_03 obj_10 obj_12 - type_1
obj_07 obj_09 obj_08 - object)
(:init
(pred_3 obj_02 obj_03)
(pred_2 obj_02 obj_05)
(pred_2 obj_02 obj_04)
(pred_3 obj_06 obj_12)
(pred_2 obj_06 obj_11)
(pred_2 obj_06 obj_01)
(pred_1 obj_07 obj_03)
(pred_1 obj_09 obj_10)
(pred_1 obj_08 obj_10)
)
(:goal
(and
(pred_1 obj_07 obj_12)
(pred_1 obj_09 obj_10)
(pred_1 obj_08 obj_10)
)
)

(:constraints
  (always (not (pred_3 obj_02 obj_12)))
)
)