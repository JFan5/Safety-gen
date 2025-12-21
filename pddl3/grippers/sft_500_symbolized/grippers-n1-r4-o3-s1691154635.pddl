(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_05 - type_1
obj_07 obj_04 - type_2
obj_09 obj_06 obj_03 obj_02 - type_3
obj_01 obj_08 obj_10 - object)
(:init
(pred_1 obj_05 obj_02)
(pred_3 obj_05 obj_07)
(pred_3 obj_05 obj_04)
(pred_2 obj_01 obj_06)
(pred_2 obj_08 obj_09)
(pred_2 obj_10 obj_03)
)
(:goal
(and
(pred_2 obj_01 obj_06)
(pred_2 obj_08 obj_03)
(pred_2 obj_10 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_05 ?b obj_04))))
)
)