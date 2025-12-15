(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_01 obj_05 - type_1
obj_04 obj_08 obj_07 obj_03 - type_3
obj_09 obj_11 obj_10 - type_2
obj_06 obj_02 - object)
(:init
(pred_3 obj_01 obj_11)
(pred_2 obj_01 obj_04)
(pred_2 obj_01 obj_08)
(pred_3 obj_05 obj_11)
(pred_2 obj_05 obj_07)
(pred_2 obj_05 obj_03)
(pred_1 obj_06 obj_10)
(pred_1 obj_02 obj_11)
)
(:goal
(and
(pred_1 obj_06 obj_09)
(pred_1 obj_02 obj_10)
)
)

(:constraints
  (always (not (pred_3 obj_01 obj_10)))
)
)