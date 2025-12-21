(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_04 obj_06 - type_1
obj_10 obj_03 obj_05 obj_11 - type_2
obj_08 obj_09 obj_01 - type_3
obj_07 obj_02 - object)
(:init
(pred_1 obj_04 obj_09)
(pred_3 obj_04 obj_10)
(pred_3 obj_04 obj_03)
(pred_1 obj_06 obj_09)
(pred_3 obj_06 obj_05)
(pred_3 obj_06 obj_11)
(pred_2 obj_07 obj_08)
(pred_2 obj_02 obj_01)
)
(:goal
(and
(pred_2 obj_07 obj_08)
(pred_2 obj_02 obj_09)
)
)

(:constraints
  (always (not (pred_1 obj_04 obj_01)))
)
)