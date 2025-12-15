(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_02 obj_09 - type_1
obj_04 obj_10 obj_07 obj_01 - type_3
obj_03 obj_12 obj_11 - type_2
obj_08 obj_05 obj_06 - object)
(:init
(pred_2 obj_02 obj_12)
(pred_3 obj_02 obj_04)
(pred_3 obj_02 obj_10)
(pred_2 obj_09 obj_11)
(pred_3 obj_09 obj_07)
(pred_3 obj_09 obj_01)
(pred_1 obj_08 obj_11)
(pred_1 obj_05 obj_03)
(pred_1 obj_06 obj_03)
)
(:goal
(and
(pred_1 obj_08 obj_03)
(pred_1 obj_05 obj_11)
(pred_1 obj_06 obj_03)
)
)

(:constraints
  (always (not (pred_2 obj_02 obj_11)))
)
)