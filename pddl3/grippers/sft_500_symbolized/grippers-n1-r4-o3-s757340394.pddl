(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_02 - type_1
obj_07 obj_08 - type_3
obj_10 obj_06 obj_09 obj_03 - type_2
obj_04 obj_01 obj_05 - object)
(:init
(pred_2 obj_02 obj_03)
(pred_3 obj_02 obj_07)
(pred_3 obj_02 obj_08)
(pred_1 obj_04 obj_10)
(pred_1 obj_01 obj_06)
(pred_1 obj_05 obj_06)
)
(:goal
(and
(pred_1 obj_04 obj_03)
(pred_1 obj_01 obj_09)
(pred_1 obj_05 obj_06)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_02 ?b obj_08))))
)
)