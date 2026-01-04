(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_07 obj_05 - type_2
obj_10 obj_03 obj_06 obj_09 - type_1
obj_01 obj_02 obj_04 - type_3
obj_08 obj_11 - object)
(:init
(pred_3 obj_07 obj_02)
(pred_1 obj_07 obj_10)
(pred_1 obj_07 obj_03)
(pred_3 obj_05 obj_02)
(pred_1 obj_05 obj_06)
(pred_1 obj_05 obj_09)
(pred_2 obj_08 obj_01)
(pred_2 obj_11 obj_04)
)
(:goal
(and
(pred_2 obj_08 obj_01)
(pred_2 obj_11 obj_02)
)
)

(:constraints
  (always (not (pred_3 obj_07 obj_04)))
)
)