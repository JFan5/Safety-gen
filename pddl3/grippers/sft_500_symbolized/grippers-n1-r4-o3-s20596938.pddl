(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_10 - type_1
obj_09 obj_06 - type_2
obj_03 obj_08 obj_04 obj_05 - type_3
obj_02 obj_07 obj_01 - object)
(:init
(pred_4 obj_10 obj_04)
(pred_1 obj_10 obj_09)
(pred_1 obj_10 obj_06)
(pred_2 obj_02 obj_03)
(pred_2 obj_07 obj_03)
(pred_2 obj_01 obj_04)
)
(:goal
(and
(pred_2 obj_02 obj_05)
(pred_2 obj_07 obj_05)
(pred_2 obj_01 obj_04)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_3 obj_10 ?b obj_06))))
)
)