(define (problem gripper-2-3-2)
(:domain gripper-strips)
(:objects obj_05 obj_09 - type_1
obj_10 obj_04 obj_03 obj_11 - type_3
obj_07 obj_08 obj_01 - type_2
obj_06 obj_02 - object)
(:init
(pred_3 obj_05 obj_01)
(pred_4 obj_05 obj_10)
(pred_4 obj_05 obj_04)
(pred_3 obj_09 obj_08)
(pred_4 obj_09 obj_03)
(pred_4 obj_09 obj_11)
(pred_2 obj_06 obj_08)
(pred_2 obj_02 obj_08)
)
(:goal
(and
(pred_2 obj_06 obj_01)
(pred_2 obj_02 obj_07)
)
)

(:constraints
  (and
    (always (not (and (pred_3 obj_05 obj_01) (pred_3 obj_09 obj_01))))
  )
)
)