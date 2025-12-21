(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_02 - type_1
obj_09 obj_05 - type_2
obj_04 obj_01 obj_03 obj_08 - type_3
obj_10 obj_06 obj_07 - object)
(:init
(pred_1 obj_02 obj_08)
(pred_3 obj_02 obj_09)
(pred_3 obj_02 obj_05)
(pred_2 obj_10 obj_08)
(pred_2 obj_06 obj_04)
(pred_2 obj_07 obj_04)
)
(:goal
(and
(pred_2 obj_10 obj_08)
(pred_2 obj_06 obj_03)
(pred_2 obj_07 obj_03)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_02 ?b obj_05))))
)
)