(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_05 obj_02 - type_1
obj_08 obj_07 obj_04 obj_01 - type_2
obj_10 obj_03 obj_09 - type_3
obj_11 obj_06 - object)
(:init
(pred_1 obj_05 obj_09)
(pred_3 obj_05 obj_08)
(pred_3 obj_05 obj_07)
(pred_1 obj_02 obj_09)
(pred_3 obj_02 obj_04)
(pred_3 obj_02 obj_01)
(pred_2 obj_11 obj_09)
(pred_2 obj_06 obj_03)
)
(:goal
(and
(pred_2 obj_11 obj_10)
(pred_2 obj_06 obj_03)
)
)

(:constraints
  (always (not (pred_1 obj_05 obj_10)))
)
)