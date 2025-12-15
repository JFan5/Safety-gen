(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_09 - type_1
obj_10 obj_08 - type_3
obj_03 obj_06 obj_07 obj_01 - type_2
obj_05 obj_02 obj_04 - object)
(:init
(pred_3 obj_09 obj_07)
(pred_4 obj_09 obj_10)
(pred_4 obj_09 obj_08)
(pred_2 obj_05 obj_07)
(pred_2 obj_02 obj_06)
(pred_2 obj_04 obj_03)
)
(:goal
(and
(pred_2 obj_05 obj_07)
(pred_2 obj_02 obj_06)
(pred_2 obj_04 obj_06)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_09 ?b obj_08))))
)
)