(define (problem gripper-2-3-3)
(:domain gripper-strips)
(:objects obj_04 obj_01 - type_1
obj_11 obj_06 obj_12 obj_07 - type_2
obj_10 obj_08 obj_03 - type_3
obj_05 obj_09 obj_02 - object)
(:init
(pred_1 obj_04 obj_08)
(pred_3 obj_04 obj_11)
(pred_3 obj_04 obj_06)
(pred_1 obj_01 obj_08)
(pred_3 obj_01 obj_12)
(pred_3 obj_01 obj_07)
(pred_2 obj_05 obj_03)
(pred_2 obj_09 obj_03)
(pred_2 obj_02 obj_10)
)
(:goal
(and
(pred_2 obj_05 obj_10)
(pred_2 obj_09 obj_10)
(pred_2 obj_02 obj_08)
)
)

(:constraints
  (always (not (pred_1 obj_04 obj_03)))
)
)