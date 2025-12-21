(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_07 - type_1
obj_03 obj_04 - type_2
obj_10 obj_08 obj_06 obj_09 - type_3
obj_05 obj_02 obj_01 - object)
(:init
(pred_1 obj_07 obj_10)
(pred_3 obj_07 obj_03)
(pred_3 obj_07 obj_04)
(pred_2 obj_05 obj_10)
(pred_2 obj_02 obj_08)
(pred_2 obj_01 obj_08)
)
(:goal
(and
(pred_2 obj_05 obj_09)
(pred_2 obj_02 obj_10)
(pred_2 obj_01 obj_10)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_4 obj_07 ?b obj_04))))
)
)