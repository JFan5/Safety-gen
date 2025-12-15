(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_05 - type_1
obj_04 obj_10 - type_3
obj_09 obj_01 obj_08 obj_06 - type_2
obj_07 obj_03 obj_02 - object)
(:init
(pred_3 obj_05 obj_09)
(pred_4 obj_05 obj_04)
(pred_4 obj_05 obj_10)
(pred_2 obj_07 obj_09)
(pred_2 obj_03 obj_06)
(pred_2 obj_02 obj_08)
)
(:goal
(and
(pred_2 obj_07 obj_08)
(pred_2 obj_03 obj_08)
(pred_2 obj_02 obj_06)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_05 ?b obj_04))))
)
)