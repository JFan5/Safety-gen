(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_03 - type_1
obj_04 obj_08 - type_3
obj_02 obj_09 obj_01 obj_10 - type_2
obj_06 obj_07 obj_05 - object)
(:init
(pred_4 obj_03 obj_02)
(pred_2 obj_03 obj_04)
(pred_2 obj_03 obj_08)
(pred_3 obj_06 obj_01)
(pred_3 obj_07 obj_09)
(pred_3 obj_05 obj_09)
)
(:goal
(and
(pred_3 obj_06 obj_09)
(pred_3 obj_07 obj_02)
(pred_3 obj_05 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_03 ?b obj_08))))
)
)