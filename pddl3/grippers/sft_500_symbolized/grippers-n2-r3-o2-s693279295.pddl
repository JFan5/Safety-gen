(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_09 obj_01 - type_1
obj_03 obj_10 obj_05 obj_06 - type_2
obj_07 obj_11 obj_04 - type_3
obj_08 obj_02 - object)
(:init
(pred_1 obj_09 obj_04)
(pred_3 obj_09 obj_03)
(pred_3 obj_09 obj_10)
(pred_1 obj_01 obj_04)
(pred_3 obj_01 obj_05)
(pred_3 obj_01 obj_06)
(pred_2 obj_08 obj_11)
(pred_2 obj_02 obj_04)
)
(:goal
(and
(pred_2 obj_08 obj_11)
(pred_2 obj_02 obj_11)
)
)

(:constraints
  (always (not (pred_1 obj_09 obj_11)))
)
)