(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_07 obj_08 - type_1
obj_09 obj_03 obj_11 obj_10 - type_2
obj_06 obj_04 obj_05 - type_3
obj_01 obj_02 - object)
(:init
(pred_2 obj_07 obj_05)
(pred_3 obj_07 obj_09)
(pred_3 obj_07 obj_03)
(pred_2 obj_08 obj_05)
(pred_3 obj_08 obj_11)
(pred_3 obj_08 obj_10)
(pred_1 obj_01 obj_04)
(pred_1 obj_02 obj_04)
)
(:goal
(and
(pred_1 obj_01 obj_04)
(pred_1 obj_02 obj_06)
)
)

(:constraints
  (always (not (pred_2 obj_07 obj_04)))
)
)