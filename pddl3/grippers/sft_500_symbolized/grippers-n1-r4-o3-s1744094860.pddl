(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_05 - type_1
obj_08 obj_09 - type_2
obj_02 obj_03 obj_01 obj_07 - type_3
obj_04 obj_10 obj_06 - object)
(:init
(pred_1 obj_05 obj_03)
(pred_3 obj_05 obj_08)
(pred_3 obj_05 obj_09)
(pred_2 obj_04 obj_07)
(pred_2 obj_10 obj_01)
(pred_2 obj_06 obj_01)
)
(:goal
(and
(pred_2 obj_04 obj_02)
(pred_2 obj_10 obj_03)
(pred_2 obj_06 obj_01)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_05 ?b obj_08))))
)
)