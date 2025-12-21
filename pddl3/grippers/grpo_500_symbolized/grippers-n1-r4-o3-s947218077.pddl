(define (problem gripper-1-4-3)
(:domain gripper-strips)
(:objects obj_10 - type_1
obj_09 obj_04 - type_3
obj_08 obj_01 obj_03 obj_02 - type_2
obj_05 obj_07 obj_06 - object)
(:init
(pred_4 obj_10 obj_08)
(pred_2 obj_10 obj_09)
(pred_2 obj_10 obj_04)
(pred_3 obj_05 obj_01)
(pred_3 obj_07 obj_08)
(pred_3 obj_06 obj_03)
)
(:goal
(and
(pred_3 obj_05 obj_08)
(pred_3 obj_07 obj_08)
(pred_3 obj_06 obj_02)
)
)

(:constraints
  (always (forall (?b - object)
           (not (pred_1 obj_10 ?b obj_04))))
)
)