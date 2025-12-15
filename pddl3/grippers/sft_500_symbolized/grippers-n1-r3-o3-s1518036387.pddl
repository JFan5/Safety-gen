(define (problem gripper-1-3-3)
(:domain gripper-strips)
(:objects obj_05 - type_3
obj_02 obj_06 - type_2
obj_01 obj_09 obj_04 - type_1
obj_07 obj_08 obj_03 - object)
(:init
(pred_3 obj_05 obj_09)
(pred_2 obj_05 obj_02)
(pred_2 obj_05 obj_06)
(pred_1 obj_07 obj_09)
(pred_1 obj_08 obj_01)
(pred_1 obj_03 obj_04)
)
(:goal
(and
(pred_1 obj_07 obj_04)
(pred_1 obj_08 obj_04)
(pred_1 obj_03 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_05 ?b obj_06))))
)
)