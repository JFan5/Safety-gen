(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_08 obj_05 - type_1
obj_11 obj_03 obj_04 obj_10 - type_2
obj_07 obj_02 obj_09 - type_3
obj_06 obj_01 - object)
(:init
(pred_1 obj_08 obj_09)
(pred_3 obj_08 obj_11)
(pred_3 obj_08 obj_03)
(pred_1 obj_05 obj_09)
(pred_3 obj_05 obj_04)
(pred_3 obj_05 obj_10)
(pred_2 obj_06 obj_09)
(pred_2 obj_01 obj_07)
)
(:goal
(and
(pred_2 obj_06 obj_07)
(pred_2 obj_01 obj_07)
)
)

(:constraints
  (always (not (pred_1 obj_08 obj_07)))
)
)