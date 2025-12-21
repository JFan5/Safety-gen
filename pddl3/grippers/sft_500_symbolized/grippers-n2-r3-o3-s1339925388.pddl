(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_09 obj_02 - type_1
obj_10 obj_11 obj_12 obj_04 - type_2
obj_01 obj_07 obj_03 - type_3
obj_08 obj_05 obj_06 - object)
(:init
(pred_1 obj_09 obj_01)
(pred_3 obj_09 obj_10)
(pred_3 obj_09 obj_11)
(pred_1 obj_02 obj_07)
(pred_3 obj_02 obj_12)
(pred_3 obj_02 obj_04)
(pred_2 obj_08 obj_07)
(pred_2 obj_05 obj_01)
(pred_2 obj_06 obj_01)
)
(:goal
(and
(pred_2 obj_08 obj_01)
(pred_2 obj_05 obj_03)
(pred_2 obj_06 obj_07)
)
)

(:constraints
  (always (not (pred_1 obj_09 obj_03)))
)
)