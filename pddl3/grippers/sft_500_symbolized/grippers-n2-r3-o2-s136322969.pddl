(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_03 obj_05 - type_1
obj_09 obj_02 obj_01 obj_10 - type_3
obj_11 obj_04 obj_06 - type_2
obj_07 obj_08 - object)
(:init
(pred_4 obj_03 obj_11)
(pred_3 obj_03 obj_09)
(pred_3 obj_03 obj_02)
(pred_4 obj_05 obj_04)
(pred_3 obj_05 obj_01)
(pred_3 obj_05 obj_10)
(pred_1 obj_07 obj_04)
(pred_1 obj_08 obj_06)
)
(:goal
(and
(pred_1 obj_07 obj_11)
(pred_1 obj_08 obj_04)
)
)

(:constraints
  (always (not (pred_4 obj_03 obj_06)))
)
)