(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_03 - type_1
obj_02 obj_08 - type_3
obj_09 obj_07 obj_10 obj_06 - type_2
obj_05 obj_01 obj_04 - object)
(:init
(pred_3 obj_03 obj_10)
(pred_4 obj_03 obj_02)
(pred_4 obj_03 obj_08)
(pred_2 obj_05 obj_09)
(pred_2 obj_01 obj_09)
(pred_2 obj_04 obj_09)
)
(:goal
(and
(pred_2 obj_05 obj_10)
(pred_2 obj_01 obj_09)
(pred_2 obj_04 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_03 ?b obj_08))))
)
)