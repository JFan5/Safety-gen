(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_07 obj_05 - type_2
obj_10 obj_06 obj_04 obj_11 - type_3
obj_08 obj_03 obj_01 - type_1
obj_02 obj_09 - object)
(:init
(pred_3 obj_07 obj_01)
(pred_4 obj_07 obj_10)
(pred_4 obj_07 obj_06)
(pred_3 obj_05 obj_01)
(pred_4 obj_05 obj_04)
(pred_4 obj_05 obj_11)
(pred_1 obj_02 obj_03)
(pred_1 obj_09 obj_01)
)
(:goal
(and
(pred_1 obj_02 obj_03)
(pred_1 obj_09 obj_03)
)
)

(:constraints
  (always (not (pred_3 obj_07 obj_03)))
)
)