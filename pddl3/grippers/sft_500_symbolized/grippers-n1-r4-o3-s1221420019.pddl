(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_04 - type_3
obj_08 obj_06 - type_2
obj_05 obj_09 obj_10 obj_03 - type_1
obj_01 obj_07 obj_02 - object)
(:init
(pred_1 obj_04 obj_05)
(pred_3 obj_04 obj_08)
(pred_3 obj_04 obj_06)
(pred_4 obj_01 obj_09)
(pred_4 obj_07 obj_05)
(pred_4 obj_02 obj_05)
)
(:goal
(and
(pred_4 obj_01 obj_03)
(pred_4 obj_07 obj_09)
(pred_4 obj_02 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_2 obj_04 ?b obj_08))))
)
)