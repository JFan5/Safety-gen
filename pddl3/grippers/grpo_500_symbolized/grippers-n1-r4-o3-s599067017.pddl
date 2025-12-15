(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_07 - type_1
obj_03 obj_02 - type_3
obj_10 obj_08 obj_09 obj_04 - type_2
obj_06 obj_05 obj_01 - object)
(:init
(pred_3 obj_07 obj_10)
(pred_4 obj_07 obj_03)
(pred_4 obj_07 obj_02)
(pred_2 obj_06 obj_09)
(pred_2 obj_05 obj_10)
(pred_2 obj_01 obj_09)
)
(:goal
(and
(pred_2 obj_06 obj_04)
(pred_2 obj_05 obj_04)
(pred_2 obj_01 obj_09)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_07 ?b obj_02))))
)
)