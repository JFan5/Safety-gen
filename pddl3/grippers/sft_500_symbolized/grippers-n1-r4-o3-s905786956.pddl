(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_10 - type_2
obj_04 obj_08 - type_1
obj_09 obj_03 obj_05 obj_06 - type_3
obj_07 obj_01 obj_02 - object)
(:init
(pred_2 obj_10 obj_05)
(pred_3 obj_10 obj_04)
(pred_3 obj_10 obj_08)
(pred_4 obj_07 obj_09)
(pred_4 obj_01 obj_05)
(pred_4 obj_02 obj_05)
)
(:goal
(and
(pred_4 obj_07 obj_03)
(pred_4 obj_01 obj_06)
(pred_4 obj_02 obj_05)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_10 ?b obj_08))))
)
)