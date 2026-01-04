(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_08 - type_1
obj_09 obj_10 obj_11 obj_05 - type_3
obj_03 obj_04 obj_12 - type_2
obj_06 obj_07 obj_01 - object)
(:init
(pred_2 obj_02 obj_12)
(pred_1 obj_02 obj_09)
(pred_1 obj_02 obj_10)
(pred_2 obj_08 obj_12)
(pred_1 obj_08 obj_11)
(pred_1 obj_08 obj_05)
(pred_3 obj_06 obj_03)
(pred_3 obj_07 obj_12)
(pred_3 obj_01 obj_04)
)
(:goal
(and
(pred_3 obj_06 obj_03)
(pred_3 obj_07 obj_04)
(pred_3 obj_01 obj_12)
)
)

(:constraints
  (always (not (pred_2 obj_02 obj_04)))
)
)